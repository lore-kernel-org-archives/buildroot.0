From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Sun, 12 Aug 2012 10:25:46 -0400
Subject: [Buildroot] [PATCH] PAM support in Busybox if linux-pam is built
In-Reply-To: <20120812141726.GP21035@sapphire.tkos.co.il>
References: <1344740623-29446-1-git-send-email-golubovsky@gmail.com>
 <20120812141726.GP21035@sapphire.tkos.co.il>
Message-ID: <CADiAo4KjWJUV9A2HrTeuddW3+mqib0UsTnmaoJWigwzfC9Wohw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,


On Sun, Aug 12, 2012 at 10:17 AM, Baruch Siach <baruch@tkos.co.il> wrote:

>> +     help
>> +       PAM support in Busybox is enabled by default if package
>> +       linux-pam is selected. Make sure that files /etc/pam.d/default
>> +       and/or /etc/pam.d/login exist and contain valid authentication
>> +       stack. Otherwise you will not be able to log into the booted
>> +       system. If unsure unselect this item.
>
> The last help sentence seems to contradict the 'default y' enable by default
> above.

My approach would be to disable it by default. However from the prior
discussion I concluded that the preferred way in Buildroot is to
enable something by default as new feature appears. So I am trying a
reasonable compromise: to make PAM enabled in busybox, but to provide
a fast way to disable it if anything goes wrong.

What would you suggest: to drop "if unsure..." or to make PAM disabled
by default in busybox?

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
