From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 30 Oct 2012 23:55:33 +0100
Subject: [Buildroot] [PATCH] libcap: disable progs altogether
In-Reply-To: <1351470854-15435-1-git-send-email-gustavo@zacarias.com.ar>
References: <1351470854-15435-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <50905AE5.4030506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/29/12 01:34, Gustavo Zacarias wrote:
> +# progs use fork()
>   define LIBCAP_BUILD_CMDS
> +	$(SED) '/-C progs/d' $(@D)/Makefile
>   	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \

  Could you do this in a post-patch hook instead? It's more verbose, but
more appropriate I think.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
