From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Aug 2013 18:06:36 +0200
Subject: [Buildroot] [PATCH] getty: add the ability to pass options to
 getty
In-Reply-To: <CAAXf6LUHMReVczEir1yXai13-jHm_zBkXQN=T-OvNdWL_BTy2Q@mail.gmail.com>
References: <1377148355-21125-1-git-send-email-shmuelzon@gmail.com>
 <CAAXf6LUHMReVczEir1yXai13-jHm_zBkXQN=T-OvNdWL_BTy2Q@mail.gmail.com>
Message-ID: <5216370C.5030804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/08/13 12:58, Thomas De Schampheleire wrote:
> There are now a number of getty-related config options in
> system/Config.in, but without any structure.
> When the getty port is empty, no action is taken.
> What about introducing a new bool option to determine if a getty needs
> to be started, with suboptions for port, baudrate, term, and
> user-configurable options?
> Something like:
>
> config BR2_TARGET_GENERIC_GETTY
>          bool "Run a getty (login prompt) after boot"
>
> config BR2_TARGET_GENERIC_GETTY_PORT
>          bool "tty port"
>          depends on BR2_TARGET_GENERIC_GETTY
>
> choice
>          prompt "baudrate"
>          depends on BR2_TARGET_GENERIC_GETTY
>
> [baudrate options]
> endchoice
>
> config BR2_TARGET_GENERIC_GETTY_TERM
>          bool "TERM environment variable"
>          depends on BR2_TARGET_GENERIC_GETTY
>
> config BR2_TARGET_GENERIC_GETTY_OPTIONS
>          string "other options to pass to getty"
>          depends on BR2_TARGET_GENERIC_GETTY

  Sounds like a good plan. Except that the sub-options should be wrapped 
in a if...endif construct instead of repeating 'depends on'.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
