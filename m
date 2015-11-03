From: Martin Bark <martin@barkynet.com>
Date: Tue, 3 Nov 2015 09:48:07 +0000
Subject: [Buildroot] [PATCH 1/1] package/nodejs: Fixed npm global install
In-Reply-To: <20151102231324.546f7ad6@free-electrons.com>
References: <1446047993-17436-1-git-send-email-martin@barkynet.com>
 <20151102231324.546f7ad6@free-electrons.com>
Message-ID: <CAFGQKxdYkef0kUj3T=z77i6CnH8ODzajmYNUwoYBzGdqQDs-6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 2 November 2015 at 22:13, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Martin Bark,
>
> On Wed, 28 Oct 2015 15:59:53 +0000, Martin Bark wrote:
>> Set npm_config_prefix to $(TARGET_DIR)/usr so that npm -g will correctly
>> install global modules to $(TARGET_DIR)/usr/lib/node_modules.
>>
>> By using npm -g to install global modules npm will now automatically create
>> the symlinks to executables under $(TARGET_DIR)/usr/bin.
>>
>> Signed-off-by: Martin Bark <martin@barkynet.com>
>> ---
>>
>> See https://docs.npmjs.com/misc/config#global and
>> https://docs.npmjs.com/files/folders for information on how the
>> prefix setting is used by global installs.
>
> This paragraph is very useful, so I wonder why you didn't put it as
> part of the commit log itself.

You know I have no idea why I didn't either :)

>
> So I've moved this paragraph to the commit log, and I've applied your
> patch. Thanks a lot, it clearly makes nodejs.mk a bit simpler!

Thanks.

Martin

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
