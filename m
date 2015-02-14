From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sat, 14 Feb 2015 11:06:28 +0100
Subject: [Buildroot] autobuild: wget getid error using br-reproduce-build
In-Reply-To: <20150214100358.GC3886@free.fr>
References: <CAHkwnC9YcaDKO75wM__BgeG34Pdnj_oWEGD3n1BTge90tB2v2g@mail.gmail.com>
 <20150214100358.GC3886@free.fr>
Message-ID: <CAHkwnC80DjgaGo_tucBY18aUwS_EuYx2Kxh=o_nmpkHFXNjwUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 14, 2015 at 11:03 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Fabio, All,
>
> On 2015-02-14 10:53 +0100, Fabio Porcedda spake thusly:
>> I'm tying to use the br-reproduce-build script to reproduce autobuild
>> errors, but the script fail when it download the getid file, eg:
>> wget http://autobuild.buildroot.org/results/d0d4618937af10ee675e84c86b13b0d48050fe47/gitid
>>
>> The problem is that the url
>> http://autobuild.buildroot.org/results/d0d4618937af10ee675e84c86b13b0d48050fe47/gitid
>> does not show the "gitid" file but it redirect to:
>>  http://autobuild.buildroot.net/results/d0d/d0d4618937af10ee675e84c86b13b0d48050fe47//
>>
>> To be able to download the getid file i must use:
>> wget http://autobuild.buildroot.net/results/d0d/d0d4618937af10ee675e84c86b13b0d48050fe47//gitid
>>
>> Is this behavior expected, so the script must be changed? Or it is a
>> web site related problem?
>
> I can reproduce, indeed.
>
> I'll try to have a look at that (plus I have quite a few improvements to
> do in that script anyway...).

Thanks for looking at it.

Now i realized that passing the id with prefix (d0d/d0d...) to the
"br-reproduce-build" script it works fine.
Nevertheless would be better to use just the id without the prefix?

BR
-- 
Fabio Porcedda
