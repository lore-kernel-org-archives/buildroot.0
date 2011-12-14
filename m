From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 14 Dec 2011 09:01:56 +0100
Subject: [Buildroot] [RFC] Python packages
In-Reply-To: <20111214084639.2a76f2bc@skate>
References: <4EE85335.9060109@visionsystems.de> <20111214084639.2a76f2bc@skate>
Message-ID: <CAAXf6LVwxWepKARkmERWCDJPL9CnvNe1GuNyqoFDv+Un839E6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Dec 14, 2011 at 8:46 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Le Wed, 14 Dec 2011 08:41:41 +0100,
> Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :
>
>> I just wanted to add some network related python packages (dpkt and
>> netifaces) to buildroot. At the moment we have only pyserial as
>> external python component,
>
> And python-mad, in package/multimedia/
>
>> residing in packages/python-serial. Should I pack these packages just
>> under Libraries->Networking or should I create special folder
>> packages/python-addons and put those packages there?
>
> Your question is strange because you're comparing a location in
> menuconfig ("Libraries->Networking") and a location in the source tree
> ("packages/python-addons") while the two are not related.
>
> From a source tree location perspective, Peter's wish is to keep
> everything directly under package/ as much as possible. So we would
> have there python/, python-serial/, python-something/,
> python-somethingelse/ and so forth. But I think they should all start
> with the python- prefix. This wasn't done with Lua extensions and I am
> personally not happy with this.
>
> Now, for the location in menuconfig, I must say I don't know. Should we
> sort them by Language (Python extensions, Lua extensions) or by usage
> type (Network, Multimedia, etc.). So far, the extensions are listed "by
> usage", along with all other libraries for the same type of usage.

I think this should depend on what you consider a 'python package'. Is
a script written in Python a python package? In my opinion it is not.
With this reasoning, such a script should be under package/scriptname
and be listed in the relevant menuconfig category. For example,
'dstat' is a system monitoring tool written in Python, and I think it
belongs under "Debugging, profiling and benchmark".

However, packages that really are extensions, i.e. add functionality
to the language that can be used by scripts written in that language,
e.g. serial communication capabilities, could be added in
package/python-foo as you suggest, and I would put them under a
language-specific menu in menuconfig. Things like python-mad, dpkt and
netifaces would fit under this category.

My reasoning is that if you as a developer need such a package, then
you already know that you need a Python interface, and so the step to
going to the Python menu. But, for scripts like dstat, you typically
don't care whether it's written in Python or another language and thus
you don't expect it to be present in the python menu but rather in the
related category.

Best regards,
Thomas
