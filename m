From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 09 Sep 2013 10:54:30 +0200
Subject: [Buildroot] [RFCv1 01/11] Makefile: make $(BUILD_DIR)/.root
 rule idempotent
In-Reply-To: <1378416469-17708-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378416469-17708-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <522D8CC6.1010308@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> The $(BUILD_DIR)/.root rule is executed as part of the 'dirs'
> target. The 'dirs' target is re-executed at every execution of 'make
> external-deps', and make external-deps explicitly tells make to ignore
> targets that have already been made (through the -B option). This
> means that the $(BUILD_DIR)/.root rule has to be idempotant, which was
> not the case this the introduction of the lib32/lib64 symbolic

"not the case {this =>since}"?

I would also cite the original commit SHA1 for easier reference:
5628776c4a4d29d07.

Apart these minor details:
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
[Tested with a few minimal configs]

Luca
