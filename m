From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 28 Jan 2019 00:26:43 -0200
Subject: [Buildroot] [PATCH 1/8] package/s6-networking: fix dependency
 when libressl is enabled
References: <20190127205214.274ecc14@windsurf.home>
Message-ID: <5c4e68636212e_30e3fbb3e150aac52e2@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Jan 27, 2019 at 05:52 PM, Thomas Petazzoni wrote:

> On Sun, 27 Jan 2019 16:59:36 -0200
> Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:
> 
>> Commit "c5b85231fb s6-networking: enable SSL if libressl is selected"
>> actually dropped the dependency on s6-dns and s6 when libressl is
>> enabled.
>> Fix this by using += inside the conditional code.
>> 
>> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
>> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>> ---
>> NOTE: I don't know why the autobuilders didn't caught this.
> 
> Because libressl is selected as part of a choice..endchoice, and such
> choices are not randomized by "randpackageconfig". Therefore, only
> OpenSSL is tested by the autobuilders, and LibreSSL is never tested.

Right. Thank you for the clarification.


Regards,
Ricardo
