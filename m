From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 31 Mar 2015 13:30:41 -0300
Subject: [Buildroot] (gtk)webkit 2.x anyone ?
In-Reply-To: <20150331174344.31147123@free-electrons.com>
References: <551ABEA0.8080808@proximus.be>
 <20150331174344.31147123@free-electrons.com>
Message-ID: <551ACBB1.7010808@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/31/2015 12:43 PM, Thomas Petazzoni wrote:
>> Anyone busy writing patches to get a recent webkit in buildroot ?
>> (The current one in buildroot crashes  (GtkLaucher) )
> 
> Yes, Gustavo is working on it.

Quick status is it's working but not yet completely clean to submit.
Lacking: JIT (completely disabled until i can test & narrow down the
combinations for it) and any *GL* acceleration (no spare/useful hardware
to test).
Details: midori 0.5.9 & webkit-gtk 2.4.8, can't use anything newer so
easily because the API changed and midori isn't compatible.
gtk2 & gtk3 working (gtk2 is always required, with webkit-gtk 2.6+ it
can be ditched but you loose plugin ability with that option).
I'm pondering packaging separate versions of webkit-gtk and adding
epiphany (now known as just "web") that can use the newer version, in
theory with almost no gnome-proper dependencies.
Thomas has being applying my assorted patches that are leading to this,
but it's still some work away from being submission-ready.
And it's being done in free time, so don't hold your breath.
Regards.
