From: Francesco Negri <francesconegri@gmail.com>
Date: Mon, 30 Jan 2017 13:08:28 +0100
Subject: [Buildroot] [PATCH v2 1/1] git-crypt: new package
In-Reply-To: <CA+KB-ZZEz1JqXhPZuoCQnoWaC81304JCc-Ae1pf_7t+Lnc9H=A@mail.gmail.com>
References: <20170130002853.76103-1-francesconegri@gmail.com>
 <20170130105808.86147-1-francesconegri@gmail.com>
 <20170130110236.4uabn3nvyz6r4vsm@tarshish>
 <CA+KB-ZZEz1JqXhPZuoCQnoWaC81304JCc-Ae1pf_7t+Lnc9H=A@mail.gmail.com>
Message-ID: <CA+KB-ZbXLs8erLcoxue2VTbr-_h5qkYsidAKJXgGke8R7AwrMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 30, 2017 at 12:07 PM, Francesco Negri
<francesconegri@gmail.com> wrote:
> I tried using the command suggested by Thomas, but the build fails with:

I found the error is caused by $(TARGET_CONFIGURE_OPTS) setting
LDFLAGS="". Setting it to LDFLAGS="-lcrypto" fixes the error. What
would be the best way to do this in git-crypt.mk?

Thanks,
Francesco
