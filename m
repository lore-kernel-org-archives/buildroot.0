From: Christian Stewart <christian@paral.in>
Date: Sat, 6 Jun 2020 15:57:36 -0700
Subject: [Buildroot] [PATCH v2 6/7] package/systemd: add an option
 BR2_PACKAGE_SYSTEMD_GUEST
In-Reply-To: <20200530124735.1384078-7-francois.perrad@gadz.org>
References: <20200530124735.1384078-1-francois.perrad@gadz.org>
 <20200530124735.1384078-7-francois.perrad@gadz.org>
Message-ID: <CA+h8R2ocxhxuvL6Vu+rqjUifkKVJmJhfP6fdhsDEQq7LoKQo4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,

On Sat, May 30, 2020 at 5:48 AM Francois Perrad <fperrad@gmail.com> wrote:
> this option allows a systemd tailored for a guest/container

I don't see any changes other than disabling kmod. Actually, in my
Docker containers I use the systemd feature of loading kernel modules,
with the kernel modules directory mapped in. So I'm not certain that
you want to disable kmod in all circumstances when a guest.

Given that this is the only effect of the flag, I don't think it's
worth adding (too little impact for a new flag).

Best,
Christian
