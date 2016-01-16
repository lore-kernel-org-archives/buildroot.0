From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Jan 2016 22:52:39 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-01-14
References: <20160115073021.DAA6410303A@stock.ovh.net>
 <jvipmcxaun.ln2@ID-313208.user.individual.net> <569AB33F.6010701@mind.be>
Message-ID: <7mqqmcx6cr.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 16 Jan 2016 22:16:47 +0100 schrieb Arnout Vandecappelle:

> On 16-01-16 11:34, Bernd Kuhls wrote:
>> the reason for this build error is a arc-only gcc bug which was fixed 
in 
>> gcc-4.9: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=59049
>> 
>> The toolchain used by the autobuilders is gcc-4.8 which explains the 
>> build error. Afaics Kconfig does not allow something like this:
>> 
>> 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 if BR2_arc
>> 
>> Could you please give me some advise on how to fix the problem?
> 
>  Apply logic. FOO if BAR is the same as FOO || !BAR.

Hi Arnout,

this would mean that the package is blocked on BR2_arc, regardless of the 
toolchain used there, and all other archs need gcc-4.9+, right?
If yes, then this is not what I want to achieve. The package works with 
all buildroot-supported gcc versions on all archs _except_ that it is 
broken on arc with gcc-4.8 or older, gcc bug 59049 is arc-only.

Regards, Bernd
