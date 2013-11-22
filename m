From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 22 Nov 2013 21:17:30 +0100
Subject: [Buildroot] [PATCH 1/1] Add support to set the default port for
 dropbear to listen on
In-Reply-To: <1485435858.899015.1385143819916.JavaMail.root@telenet.be>
References: <1485435858.899015.1385143819916.JavaMail.root@telenet.be>
Message-ID: <528FBBDA.6020105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/11/13 19:10, jeroen.de.wachter at telenet.be wrote:
> A menu entry has been added to set the port. This menu entry
> is processed like entries that were already present and will
> rewrite one line of the options.h file that is used by
> dropbear during compilation.
>
> Signed-off-by: Jeroen De Wachter<jeroen.de_wachter@alcatel-lucent.com>

  Hi Jeroen,

  Thank you for your patch. However, I don't think we will accept it in 
buildroot. We could make thousands of configuration options that deal 
with all possible fine-grained tweaking. And especially in this 
particular case, the option is quite invasive (requires 5 additional 
lines in the .mk file) and it is possible to achieve the same result by 
adding a command-line option to dropbear, by including a custom 
S50dropbear to your fs-overlay.

  But of course, our friendly maintainer may be of a different opinion.

  The patch itself looks good BTW, except that indentation should be with 
a tab (tab + 2 spaces for the Config.in help text).

  Regards,
  Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
