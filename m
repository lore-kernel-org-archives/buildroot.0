From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 8 Sep 2014 13:20:56 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140908111733.1966e641@free-electrons.com>
References: <20140907063013.1CB98101499@stock.ovh.net>	<20140907100918.6b017a09@free-electrons.com>	<540D69A4.4080503@imgtec.com>	<20140908103445.6a8858b4@free-electrons.com>	<540D6ADB.30300@imgtec.com>
 <20140908111733.1966e641@free-electrons.com>
Message-ID: <540D9F28.1010709@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/08/2014 10:17 AM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Mon, 8 Sep 2014 09:37:47 +0100, Vicente Olivert Riera wrote:
>
>> Well, more build logs related to this issue are useless because it's
>> being handled upstream, so, yes, maybe we should disable it for MIPS64
>> n32 until this problem gets fixed.
>
> Well, the issue has been reported upstream in May 2014 according to
> what you said, and upstream did react much since then. With Qt5 being
> out since quite some time now, I fear that upstream may simply never
> fix the bug for Qt4. Which indeed is another reason to disable Qt4 on
> MIPS64 n32.
>
> Thomas

Here is the patch to disable qt4 webkit for MIPS64 n32:

http://patchwork.ozlabs.org/patch/386910/

One could think we should add that dependence to the 
BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT symbols instead, but there are 
packages depending on that symbol which compile fine on MIPS64 n32, for 
instance grantlee.

-- 
Vincent
