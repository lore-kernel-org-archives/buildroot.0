From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 02 May 2012 10:33:15 -0300
Subject: [Buildroot]
 =?utf-8?q?add_option_to_enable_AI=5FADDRCONFIG_suppor?=
 =?utf-8?q?t?=
In-Reply-To: <871uotshw1.fsf@macbook.be.48ers.dk>
References: <1331159898-25350-1-git-send-email-s.neumann@raumfeld.com>
 <20120308091714.5d60b715@skate> <87wr6q26x5.fsf@macbook.be.48ers.dk>
 <20120315213337.448d1bfd@skate> <871uotshw1.fsf@macbook.be.48ers.dk>
Message-ID: <fe438d94e76d8ae4fbe627c3153b0e94@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-15 17:56, Peter Korsgaard wrote:

>  Thomas> Is it common to have AI_ADDRCONFIG disabled in external 
> toolchains?
>  Thomas> Notice that we have a similar problem with ltp-testsuite at
> the moment.
>
> Hard to say, but the config option defaults to 'n' in uClibc - So
> chances are that it is.
>
>  Thomas> Do we really want to add one more toolchain option just for
>  Thomas> this small feature? Sounds like a big hammer, no?
>
> True, but it is the safest approach. I don't feel strongly about it
> though - Anybody?

IMHO it should be enabled by default, it's been in glibc since version 
2.3.
Some programs benefit a lot in the configuration department from it, 
for example samba.
Doing a interfaces=192.168.1.1/255/255/255.0 statement versus a 
interfaces=eth0 statement in the configuration file is a big bonus to 
me.
I'm sending a patch right away.
Regards.
