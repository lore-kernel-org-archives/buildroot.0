From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sat, 1 Apr 2017 18:01:32 -0400
Subject: [Buildroot] [v6] package: add qt5virtualkeyboard
In-Reply-To: <ac078dac-035a-9ab2-7fe9-69641e8ab89d@mind.be>
References: <20170330171842.29179-1-gael.portay@savoirfairelinux.com>
 <20170401150938.644ed92b@free-electrons.com>
 <ac078dac-035a-9ab2-7fe9-69641e8ab89d@mind.be>
Message-ID: <20170401220132.26y4ijds66lwkxg7@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sat, Apr 01, 2017 at 11:05:51PM +0200, , Vandecappelle wrote:
> 
> 
> On 01-04-17 15:09, Thomas Petazzoni wrote:
> > Hello,
> > 
> [snip]
> > Perhaps we could do:
> > 
> > ifneq ($(findstring zh_CN,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
> 
>  Or just the pattern we use everywhere else:
> 
> ifneq ($(filter zh_CN all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
> 

Thanks! it was the solution I wanted.

>  Regards,
>  Arnout
> 
> > QT5VIRTUALKEYBOARD_INSTALL_PINYIN = YES
> > endif
> > 
> > ifneq ($(findstring ja_JP,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
> > QT5VIRTUALKEYBOARD_INSTALL_OPENWNN = YES
> > endif
> > 
> > ...
> > 
> > ifneq ($(findstring all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
> > QT5VIRTUALKEYBOARD_INSTALL_PINYIN = YES
> > QT5VIRTUALKEYBOARD_INSTALL_OPENWNN = YES
> > ...
> > endif
> > 
> > And then use the QT5VIRTUALKEYBOARD_INSTALL_<foo> variables to know
> > what should be installed.
> > 
> >> +ifneq ($(strip $(QT5VIRTUALKEYBOARD_3RDPARTY_PARTS)),)
> > 
> > strip really needed?
> > 
> > Thanks,
> > 
> > Thomas
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

Regards,
Gael
