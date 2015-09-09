From: Brendan Heading <brendanheading@gmail.com>
Date: Wed, 9 Sep 2015 12:16:43 +0100
Subject: [Buildroot] [PATCHv2] gdb: prevent building the documentation
In-Reply-To: <1441796566-12110-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441796566-12110-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <CA+BsyQ5A5KP0hTNMXxUb-phudJ2eMG67YbZ7dcVuG1q6b8Q31A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> +# Prevent gdb to build the documentation
> +define GDB_DISABLE_DOC
> +       $(SED) '/^SUBDIRS =/ s/doc//' $(@D)/gdb/Makefile.in
> +endef
> +GDB_POST_PATCH_HOOKS += GDB_DISABLE_DOC

Vincente,

I applied the patch but it fails for host GDB, I think because you also need :

HOST_GDB_POST_PATCH_HOOKS += GDB_DISABLE_DOC

Brendan
