From: Mitch Davis <mjd+buildroot@afork.com>
Date: Fri, 22 Oct 2010 09:36:59 +1100
Subject: [Buildroot] Firmware Loading
In-Reply-To: <9F13A3F8731E4CB9B825A924ACC0A6A3@RnD>
References: <9F13A3F8731E4CB9B825A924ACC0A6A3@RnD>
Message-ID: <AANLkTimXjTqcxPAWovUrU=vwFk2n8mEwQ-p6W4am8SAs@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 22, 2010 at 8:03 AM, Neal Peacock <neal@coinfree.com> wrote:
> I realize this is kind of an old post but I think I'm having the same
> trouble
> with the carl9170 driver on my embedded system. ?Could you post how you
> setup udev to handle the firmware loading? ?I tried echoing udevd into the
> proc/sys/kernel/hotplug and all and I know I have the .sh script in place
> but nothing seems to be happening and firmware loads always time out.

If you add this to the .sh file:

  date >> /tmp/dates.txt

Does /tmp/dates.txt change after the event?

If you create a shell script with a similar "date" line into
/proc/sys/kernel/hotplug, does dates.txt change?

Mitch.
