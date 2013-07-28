From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 16:03:42 +0200
Subject: [Buildroot] [PATCH] busybox: register mdev as hotplug helper
In-Reply-To: <51F52439.4060001@zacarias.com.ar>
References: <1373574654-32427-1-git-send-email-gustavo@zacarias.com.ar>
 <CAAXf6LVSOCLS54uAwJHH6DwenrexRY=17v_PoOe_KTnmWWTvWg@mail.gmail.com>
 <51DFDA1F.60904@zacarias.com.ar>
 <CAAXf6LWVWj-Z2Od9Zc=QjWELd3_R+5MQ+gTBo=dO-VgFiDoxGg@mail.gmail.com>
 <51F50077.2060204@zacarias.com.ar> <20130728151418.70891325@skate>
 <51F51EBE.4000701@zacarias.com.ar> <20130728155156.1bc37ffd@skate>
 <51F52439.4060001@zacarias.com.ar>
Message-ID: <20130728160342.476c95ce@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 28 Jul 2013 11:01:29 -0300, Gustavo Zacarias wrote:

> It basically boils down to helping people or not on alternate scenarios.
> Some random guy in #pandaboard was having issues loading firmware on a
> prebuilt kernel (which sometimes happens to be a sore PITA to build a
> working kernel with some vendors/for some people, no point in arguing
> that no matter how much we wish everything were upstreamed/vanilla) for
> WiFi support and (obviously) mdev wasn't working.
> Solution was get your kernel source/config right, or fix the script.
> The script was a quick way out without bad side effects.
> On a personal level i don't care about the patch, it was just a quick
> and painless way of fixing a common problem.

Right. But then maybe the 2>/dev/null should be removed, so that if the
sysctl file to set the hotplug helper doesn't exist, the user sees that
something is wrong?

(That said, I think CONFIG_HOTPLUG has become mandatory in recent
kernels, so it shouldn't be a big problem.)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
