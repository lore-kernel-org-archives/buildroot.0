From: Avraham Shukron <avraham.shukron@gmail.com>
Date: Fri, 3 Jan 2020 20:40:30 +0200
Subject: [Buildroot] [PATCH 02/11] support/scripts/pkg-stats: store pkg
 dir path
In-Reply-To: <20200103151849.10956-3-heiko.thiery@gmail.com>
References: <20200103151849.10956-1-heiko.thiery@gmail.com>
 <20200103151849.10956-3-heiko.thiery@gmail.com>
Message-ID: <CAJX3zAsWkjWwULNNDfviFoZvouyrMoCeWSdUNMhbiXy5rhyU7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 3, 2020 at 5:19 PM Heiko Thiery <heiko.thiery@gmail.com> wrote:

> @@ -88,7 +89,7 @@ class Package:
>          Fills in the .infras field
>          """
>          self.infras = list()
> -        with open(self.path, 'r') as f:
> +        with open(os.path.join(self.pkg_path, self.name + '.mk'), 'r')
> as f:
>              lines = f.readlines()
>              for l in lines:
>                  match = INFRA_RE.match(l)
>

Assuming this code worked before, and that you didn't change the meaning of
`self.path`, I don't see the motivation behind this chunk...
It seems like you are reconstructing `self.path` from `self.pkg_path`. Am
I missing something?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200103/728a64b8/attachment.html>
