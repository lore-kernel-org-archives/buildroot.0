From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 9 Apr 2019 09:39:43 +0300
Subject: [Buildroot] [PATCH] gettext-tiny: Make libiconv only target
 dependency
In-Reply-To: <20190409080207.0bc7649b@windsurf.home>
References: <20190408140442.29566-1-abrodkin@synopsys.com>
 <20190408230530.0a8a67be@windsurf.home>
 <20190408215410.e3mxykdxrm23y3ml@vkochan-ThinkPad-T470p>
 <20190409080207.0bc7649b@windsurf.home>
Message-ID: <20190409063943.2uac4za2nt445j5a@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Alexey, All

On Tue, Apr 09, 2019 at 08:02:07AM +0200, Thomas Petazzoni wrote:
> On Tue, 9 Apr 2019 00:54:10 +0300
> Vadim Kochan <vadim4j@gmail.com> wrote:
> 
> > libiconv is needed by msgfmt and msgmerge during "translation" on the
> > host so I think host-gettext-tiny should depend on host-libiconv.
> 
> There is no such thing as "host-libiconv". We do not need it, because
> we assume the host system is iconv-capable.
> 
> The only thing gettext-tiny does for the target is install the wrapper
> gettext program, so it certainly does not need libiconv.
> 
> The right fix is to remove this conditional libiconv dependency
> entirely, and probably we should do the same for the gettext-gnu
> package.
> 

Thanks for the explanation!

Regards,
Vadim Kochan
