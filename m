From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 9 Oct 2013 10:26:56 +0200
Subject: [Buildroot] [PATCHv3 04/20] toolchain: introduce a virtual
	package
In-Reply-To: <1381256237-27948-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHkwnC_wbNa4Mg24WTPGjmmMSk2tYcNfmSzV66CVkzfmZ-2T2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Oct 8, 2013 at 8:17 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> [...]
>  prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>
> -toolchain: prepare dirs dependencies $(BASE_TARGETS)
> -
> -world: toolchain $(TARGETS_ALL)
> +world: $(BASE_TARGETS) $(TARGETS_ALL)

Why do you change that? It seems to me better to use the "toolchain"
target as dependency instead of $(BASE_TARGETS)
IMHO  $(BASE_TARGETS) is an implementation detail of the new toolchain
virtual package so it's better to use inside the new toolchain virtual
package.

> [...]

Best regards
-- 
Fabio Porcedda
