From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 15 Aug 2014 08:33:38 -0400
Subject: [Buildroot] [PATCH] package/erlang: build host erlang with ssl
 support to match target
In-Reply-To: <20140815103634.00751fb4@free-electrons.com>
References: <1407968827-12487-1-git-send-email-yann.morin.1998@free.fr>
 <20140815103634.00751fb4@free-electrons.com>
Message-ID: <CA+-urNQ5OWd9ZF3xeOVnPz7QZDuJiNjgv3RGhP+iPVjB9hbzdw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Aug 15, 2014 at 4:36 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Yann E. MORIN,
>
> On Thu, 14 Aug 2014 00:27:07 +0200, Yann E. MORIN wrote:
>
>> If the target erlang has SSL support, so shoud the host-erlang.
>
> Why?

After more thought, I think that the reasoning should be that the
common Erlang build tools reference openssl. (openssl is used for
Erlang's crypto support, so the moment you run code that computes a
SHA1, you need it.) I'd be fine with host-erlang always having ssl
enabled since the error message you get when you don't have it enabled
is not obvious to anyone who doesn't use Erlang.

Frank
