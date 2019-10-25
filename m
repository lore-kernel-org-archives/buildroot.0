From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 25 Oct 2019 15:02:24 -0500
Subject: [Buildroot] [PATCH 1/1] busybox: write commented login line in
 /etc/inittab when getty disabled
In-Reply-To: <20191001130948.17935-1-mailist@logilin.fr>
References: <20191001130948.17935-1-mailist@logilin.fr>
Message-ID: <CANQCQpaW=qssNfSbnLmHiR-edzfUhMmuqTA857wm5C8LfLzX1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stephen,

On Tue, Oct 1, 2019 at 8:49 AM Stephen Bos <mailist@logilin.fr> wrote:
>
> From: Stephen Bos <stephen.bos@hagergroup.com>
>
> When the "Run a getty" option is disabled, busybox doesn't remove the
> /etc/inittab line from previous builds. With this patch, the line is
> correctly commented out.
>
> Signed-off-by: Stephen Bos <stephen.bos@hagergroup.com>
> Co-authored-by: Stephen Bos <stephen.bos@hagergroup.com>
> Co-authored-by: Christophe Blaess <christophe.blaess@logilin.fr>

1) Setup a basic busybox build and verified console was setup with
getty after a full build
2) Unchecked the getty and verified it was commended out in inittab
after a rebuild
3) Enabled getty and changed tty used, rebuilt and verified tty string updated
4) Disabled getty  and verified it was commended out after a rebuild

Tested-by Matt Weber <matthew.weber@rockwellcollins.com>
