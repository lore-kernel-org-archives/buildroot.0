From: =?ISO-8859-1?Q?J=F6rg_Krause?= <jkrause@posteo.de>
Date: Tue, 22 Jul 2014 10:23:51 +0200
Subject: [Buildroot] [RFC 1/3] Rename package mpc to libmpc
In-Reply-To: <20140721201921.35334933@free-electrons.com>
References: <1405951937-21226-1-git-send-email-jkrause@posteo.de>	<1405951937-21226-2-git-send-email-jkrause@posteo.de>	<20140721162558.749a1393@free-electrons.com>	<53CD400B.1070106@zacarias.com.ar>
 <20140721201921.35334933@free-electrons.com>
Message-ID: <53CE1F97.1020300@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,
Dear Gustavo,

On 07/21/2014 08:19 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Mon, 21 Jul 2014 13:30:03 -0300, Gustavo Zacarias wrote:
>> On 07/21/2014 11:25 AM, Thomas Petazzoni wrote:
>>
>>> That being said, I would prefer to find a different name for the mpc
>>> package (mpd client) rather than renaming existing packages.
>> +1
>> Renaming it is potentially very problematic for people that use mpc
>> (multiprecision library) for their own projects, mpc would be a
>> completely different thing now and we can't make it legacy either since
>> there would be a new mpc.
>> Just call it mpclient and use a different bool IMHO.
> Agreed. "mpclient" sounds like a good alternative.

okay, I understand that renaming is potentially problematic. But the 
package mpc is not a dependency for any package. gmp is a dependency for 
eight packages, and mpfr for one.

Looking at Debian, Arch, and Fedora, these packages are all named 
libmpc, libgmp, and libmpfr. I liked the idea of having consistent 
package names. And if I am searching for mpc in the menuconfig I find 
the multiprecision library as libmpc and the mpd client as mpc. So it's 
not to difficult to find the right package.

There are dozen of clients for mpd. At least calling the package 
"mpclient" will show my the package when searching for "mpc" in the 
menuconfig.

Btw, is there any rule for duplicate names?

Best regards
J?rg
