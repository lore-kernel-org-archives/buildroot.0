From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Sep 2017 23:05:38 +0200
Subject: [Buildroot] Change CFLAGS for a certain package
In-Reply-To: <1505974939125-0.post@n4.nabble.com>
References: <1505974939125-0.post@n4.nabble.com>
Message-ID: <933ab6ef-1b10-b089-744f-c73f925cba1c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-09-17 08:22, mikmik wrote:
> I have a generic-package 'hello' contains hello.c and Makefile.
> In the mk file I want to build HELLO_CONFIGURE_OPTS just as
> TARGET_CONFIGURE_OPTS but change only CFLAGS to my desired CFLAGS for hello
> (say just '-g').
> 
> Right now, I used sed on TARGET_CONFIGURE_OPTS and replaced CFLAGS. It
> works.
> But there isn't a more easy or intuitive way to replace some variables on
> TARGET_CONFIGURE_OPTS?

 For almost all options, you can just override them by specifying the additional
option later. For example, if CFLAGS contains "-g -g0" then you don't get
debugging info. So, you can always just append to cflags:

HELLO_CONFIGURE_OPTS += CFLAGS="$(TARGET_CFLAGS) -g"


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
