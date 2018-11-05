From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Nov 2018 23:22:03 +0100
Subject: [Buildroot] [PATCH] ifupdown-script: send current hostname in
 DHCP request
In-Reply-To: <CANQCQpbA-2rdHtpBs8sE=R0UE0R+GGY4fXza-kxtY+x_7LrLdg@mail.gmail.com>
 (Matthew Weber's message of "Thu, 1 Nov 2018 22:28:17 -0500")
References: <20181030171614.32609-1-peter@korsgaard.com>
 <CANQCQpbA-2rdHtpBs8sE=R0UE0R+GGY4fXza-kxtY+x_7LrLdg@mail.gmail.com>
Message-ID: <8736sfcghg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

 > Peter,
 > On Tue, Oct 30, 2018 at 12:16 PM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> 
 >> For the default (BR2_SYSTEM_DHCP) /etc/network/interfaces handling.
 >> 
 >> Both the "big" and busybox ifupdown variants pass the hostname argument to
 >> the DHCP client through the shell, so we can use $() to expand to the
 >> current hostname value.
 >> 
 > The man page for the interfaces file mentioned that only pump, dhcpcd
 > and udhcpc use the hostname value from interfaces.  With dhclient
 > requiring the dhclient.conf to specify the set hostname option with
 > the hostname string.  Would it be worth mentioning that here in the
 > comment that for most (pump, dhcpcd, udhcpc) the hostname parameter
 > will work but some clients like dhclient require a separate
 > configuration file?

 > Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

I've added a comment about that and applied, thanks.

-- 
Bye, Peter Korsgaard
