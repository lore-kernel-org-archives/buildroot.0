From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Dec 2013 22:11:08 +0100
Subject: [Buildroot] [PATCH 1/1] linux.mk: enable options for ktap
In-Reply-To: <CAAXf6LX8WnxbJp=st28-15_xY54YC2DdhROCsHRq0nAaMj3qUw@mail.gmail.com>
 (Thomas De Schampheleire's message of "Mon, 16 Dec 2013 16:28:14
 +0100")
References: <1387191200-20387-1-git-send-email-anders@chargestorm.se>
 <CAAXf6LVOssD-uJP6E3oFRg3DOca7N8sR+PzrBtLZDd=1PVTjVw@mail.gmail.com>
 <20131216144447.GB5876@ad.chargestorm.se>
 <CAAXf6LX8WnxbJp=st28-15_xY54YC2DdhROCsHRq0nAaMj3qUw@mail.gmail.com>
Message-ID: <87fvpsqz6b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 >> We've got three options:
 >> 
 >> 1) Let it be as it is today
 >> 2) Change the text to state that those options are automatically enabled
 >> 3) Do as e.g. systemd does, which enables cgroups without mentioning in
 >> Config.in. I.e. remove the discussion of those options from
 >> ktap/Config.in.
 >> 
 >> I'm indifferent to either of these solutions.

 > Let's indeed see what others think, but my opinion:
 > - it's good that ktap/Config.in mentions the options, so that users
 > with an external toolchain are notified

I guess you mean 'external kernel'? ktap depends on BR2_LINUX_KERNEL so
it only works when buildroot builds the kernel.

 > - it would be good to reassure users that do have a buildroot-built
 > kernel that everything is fine for them.

Agreed, I've added a comment explaining that.

-- 
Bye, Peter Korsgaard
