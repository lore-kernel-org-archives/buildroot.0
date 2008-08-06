From: Wade Berrier <wberrier@gmail.com>
Date: Wed, 6 Aug 2008 08:48:50 -0600
Subject: [Buildroot] [PATCH] Remove readline for which
In-Reply-To: <20080805200557.GM9208@mx.loc>
References: <bbbeeccd0808051244k582789fdtae270bde1ac4aa1b@mail.gmail.com>
	<20080805200557.GM9208@mx.loc>
Message-ID: <bbbeeccd0808060748q411d831fv9c7ec7a48862fcff@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Aug 5, 2008 at 2:05 PM, Bernhard Fischer <rep.dot.nop@gmail.com> wrote:
> Hi Wade, *,
>
> On Tue, Aug 05, 2008 at 01:44:50PM -0600, Wade Berrier wrote:
>>Hi,
>>
>>I've patched 'which' to not require readline on the source level
>>instead of selecting it on the buildroot dependency level.
>
> I suggest you try to get that fixed upstream so they do allow for
> ./configure --disable-readline-and-yes-i-really-do-not-want-it

I saw some changes in their 'NEWS' implying not wanting to depend on
readline any longer, so I'm wondering if this slipped through on a
bash update.  (ie: which 2.16 doesn't depend on readline, whereas 2.19
does).

>
> Short of that, why don't you use busybox in the first place?
>
> I'm really curious how big your "fixed" which binary is?
>
> Mine looks like this, perhaps your's is smaller?
> $ size debianutils/which.o
>   text    data     bss     dec     hex filename
>    211       0       0     211      d3 debianutils/which.o
>
> Just to give you some background: buildroot is ment to serve as an
> environment for uClibc. That's it's primary goal AFAIU. Second, it's
> ment to serve as an easy way to get you a _small_ filesystem (thus using
> busybox targeted at uClibc).
>
> There is really no reason why .._HIDE_OTHER is visible to a casual user
> since it's not ment to be actually used, but just to test uClibc, in my
> POV. Please, just set BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y in your toplevel
> .config.

The system I'm working on isn't as concerned with filesystem size.
I'm upgrading to a recent buildroot (mainly for a toolchain and kernel
upgrade) and need to keep the package selection as close as possible
to the original configuration from a few years ago.

Nonetheless, I do appreciate the background information and explanations.

>>
>>Patch attached.
>
> As said. Re-read the patch. Send it to the maintainers of "debianutils"
> and understand why they will most likely reject it in it's current form.
> HTH,
>

As above, I think this reference to readline slipped through.  I'll go
see what they say.

Thanks!

Wade
