From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Sep 2015 09:56:47 +0200
Subject: [Buildroot] [PATCH] libtasn1: bump to version 4.6
In-Reply-To: <55F74581.5070301@mind.be>
References: <1442010269-372-1-git-send-email-gustavo@zacarias.com.ar>
 <55F3EFAC.7060306@imgtec.com>
 <20150913121206.64758da8@free-electrons.com>
 <87fv2icd1d.fsf@dell.be.48ers.dk>
 <20150913232043.415b5d1a@free-electrons.com>
 <55F74581.5070301@mind.be>
Message-ID: <20150915095647.140ee099@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Tue, 15 Sep 2015 00:09:05 +0200, Arnout Vandecappelle wrote:

>  file has the advantage of also working for scripts, and should even work for
> FLAT binaries (which readelf wouldn't like). But it doesn't show the CPU, ISA
> and FP details, which are useful to check as well.
> 
>  So the perfect approach would be: file, and readelf if file says it's an ELF.

Right.

>  Or, of course, python-magic and python-pyelftools :-)

Indeed, but then we would have to make the test optional so that
Buildroot can continue to work on systems where those additional Python
modules are not available. Which isn't as good as an unconditional
test that relies on already available utilities.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
