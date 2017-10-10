From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Oct 2017 12:23:28 +0200
Subject: [Buildroot] [PATCH] parted: properly link with libiconv
In-Reply-To: <CAPzckP6FYH1rQPVnaozWg167THtdhovB7nYtX=XVe5_yM7W2Gg@mail.gmail.com>
References: <20171007230611.25347-1-arnout@mind.be>
 <20171008230925.55777190@windsurf>
 <CAPzckP6FYH1rQPVnaozWg167THtdhovB7nYtX=XVe5_yM7W2Gg@mail.gmail.com>
Message-ID: <abfbfba1-5d59-2884-e672-1f4c33420398@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-10-17 12:15, Sjoerd Venema wrote:
> Hi All,
> 
> Is there any way for me, a "user" to get udisks (depending on the problematic
> parted package) on my buildroot built?
> I'd be happy with a quick hack or dirty workaround for the moment. My project is
> now somewhat dead in the water...

 One quick hack should be to enable BR2_ENABLE_LOCALE=y, which will disable the
libiconv package because it will be part of uClibc.


 Regards,
 Arnout

> I'm not demanding anyone to go out of their way to support just one guy in the
> crowd, just want to know if there are any possible quick fixes... ;-)
> Much appreciated! :)

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
