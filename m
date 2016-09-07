From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 7 Sep 2016 20:22:48 -0300 (BRT)
Subject: [Buildroot] [PATCH 6/6] gtest: retrieve package from github
In-Reply-To: <96c748a7-e46e-fce4-f4f1-9271928e3468@mind.be>
References: <1472660696-21640-1-git-send-email-fabrice.fontaine@orange.com>
 <2126371293.3550600.1473170292030.JavaMail.zimbra@datacom.ind.br>
 <96c748a7-e46e-fce4-f4f1-9271928e3468@mind.be>
Message-ID: <983781693.3690991.1473290568772.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "Carlos Santos" <casantos@datacom.ind.br>, "Fabrice Fontaine" <fontaine.fabrice@gmail.com>
> Cc: "Fabrice Fontaine" <fabrice.fontaine@orange.com>, buildroot at buildroot.org
> Sent: Tuesday, September 6, 2016 5:40:58 PM
> Subject: Re: [Buildroot] [PATCH 6/6] gtest: retrieve package from github

> On 06-09-16 15:58, Carlos Santos wrote:
>>> From: "Fabrice Fontaine" <fontaine.fabrice@gmail.com>
>>> To: buildroot at buildroot.org
>>> Cc: "Fabrice Fontaine" <fabrice.fontaine@orange.com>
>>> Sent: Wednesday, August 31, 2016 1:24:56 PM
>>> Subject: [Buildroot] [PATCH 6/6] gtest: retrieve package from github
>> 
>>> https://googletest.googlecode.com/files is no more available, so update
>>> gtest.mk and gtest.hash to retrieve googletest source code as a tar.gz
>>> (and not a zip) from github as https://googletest.googlecode.com is now
>>> a redirection to https://github.com/google/googletest.
>>>
>>> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> [snip]
>> GMock needs to be fixed too. I attempted to do this before
>> (http://patchwork.ozlabs.org/patch/586130/) but it was refused, unfortunately.
> 
> Quoting Yann from that patchwork entry:
>> As I understand it, gtest and gmock are being phased out as separate
>> packages, and are to be replaced with the googletest package.
>> 
>> So why don't we directly add "googletest" and get rid of gtest and
>> gmock, rather than fix them to eventually get rid of them?
> 
> In that contet, I think it's a sane idea to have this commit as a first step,
> and do the bump to v1.8.0 (which implies merging gtest and gmock) in a second
> step.

It can be done, even though I don't think it's really necessary
to do this.

> Fabrice, care to work on that? If you do, here are some tips:
> 
> - GMOCK should become a suboption of GTEST: BR2_PACKAGE_GTEST_GMOCK.
> - A legacy entry should be added for it.
> - gmock now has a usable cmake and builds gtest implicitly.
> - host-gmock is tricky - but perhaps it's no longer needed.

I just sent an updated patch with a proposed solution for the gmock
host-gmock packages using virtual packages, so no legacy entry is
necessary.

Carlos Santos (Casantos)
DATACOM, P&D
