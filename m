From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Mon, 4 Sep 2017 20:11:07 +0300
Subject: [Buildroot] Realtek-patched hostapd
Message-ID: <CADmjQgurGWOAgJW9bH4-zugv4C_Gz-satoLMJo-BxYToDGhj5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear colleagues,

let me ask for your advice.

I'll start with an overview.

Linux drivers for Realtek wireless chips do not fully implement the
netlink interface. Because of that, hostapd cannot control them with
its default netlink driver. There's a patch to hostapd, written
originally by Realtek, which adds support for their chips. To build a
patched hostapd in Buildroot, one can add the Realtek patch to the
custom patches, and build the package in the usual way. This works
fine, but the resulting binary will still include support for the
netlink driver and will depend on the netlink library, which is
superfluous in our circumstances.

To get rid of this dependency and build a specifically-targeted
hostapd binary which supports Realtek chips only, I have to "clone"
hostapd package and, by editing its Config.in and .mk files, drop
netlink dependency.

The question is, should I contribute this Realtek-only version of the
hostapd package, or dropping the netlink dependency is not a good
reason for creating one more package?

-- 
Best regards,
Alexander.
