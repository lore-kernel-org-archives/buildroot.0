From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Feb 2009 20:20:40 +0100
Subject: [Buildroot] kernel hangs after NET: Registered protocol family
	16
In-Reply-To: <A2E63C94AB8EE543B8743CB1AD8F976159036534@NEWPOSISERVER.positronics.local>
	(Kelvin Chan's message of "Mon\, 16 Feb 2009 19\:06\:25 -0800")
References: <A2E63C94AB8EE543B8743CB1AD8F976159036534@NEWPOSISERVER.positronics.local>
Message-ID: <87hc2q8c8n.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Kelvin" == Kelvin Chan <kelvinc@positronics.com> writes:

 Kelvin> Hi guys,

 Kelvin> I'm using a ALIX 2c3 and my kernel hangs after "NET:
 Kelvin> Registered protocol family 16" I'm almost sure this is more
 Kelvin> of a kernel build config issue but not sure where to find
 Kelvin> answers. The dump looks like kernel is waiting for a
 Kelvin> subsystem or driver to init but that particular system/driver
 Kelvin> is not built. Can someone confirm that?

 Kelvin> Freeing SMP alternatives: 0k freed
 Kelvin> net_namespace: 288 bytes
 Kelvin> NET: Registered protocol family 16

This is normally where device drivers get initialized. Try booting
with initcall_debug added to the kernel cmdline to see if that gives a
hint to where it hangs.

-- 
Bye, Peter Korsgaard
