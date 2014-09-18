From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 18 Sep 2014 19:54:18 -0400
Subject: [Buildroot] [PATCH] pkg-utils: the MESSAGE macro already
 double-quotes the message
In-Reply-To: <1411079328-30097-1-git-send-email-yann.morin.1998@free.fr>
References: <1411079328-30097-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CANxTyt58Dk-+0jG3NW5JgSH17BL76fucVF_vrmdWqHZ05mmxBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Thu, Sep 18, 2014 at 6:28 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> ... so passing a double-quoted message to the macro defeats the quoting
> altogether.
>
> Remove double-quotation of messages. Change made with:
>     $ sed -r -i -e 's/(call MESSAGE,)"(.*)"\)/\1\2)/g' \
>           $(git grep -l -E 'call MESSAGE."')
>

If there's any virtue to limiting the patch, I think that you could
end the quotes in MESSAGE before the $1, and resume them after the $1,
and then leave the quotes in all those files:

MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION)
"$(1)"$(TERM_RESET)"

                                                                ^
^

Danomi -
