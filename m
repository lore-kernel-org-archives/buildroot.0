From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Jan 2014 07:48:34 +0100
Subject: [Buildroot] [PATCH] openssl: fix bug #6770
In-Reply-To: <1389309614-17911-1-git-send-email-gustavo@zacarias.com.ar>
References: <1389309614-17911-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <52D4DDC2.9030904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/01/14 00:20, Gustavo Zacarias wrote:
> openssl 1.0.1f Makefile.org doesn't quote $(CC) when passing the
> parameter in another invocation of make, hence breaking when the
> compiler string contains a space with multiple strings (for example with
> ccache).

  It would be nice if the autobuilders would capture this issue. E.g. by 
enabling ccache 50% of the time (and clearing the cache every time, 
because we know it doesn't work correctly and because failures would be 
impossible to reproduce).

  Regards,
  Arnout

>
> Signed-off-by: Gustavo Zacarias<gustavo@zacarias.com.ar>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
