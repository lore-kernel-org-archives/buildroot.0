From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Tue, 26 Apr 2016 08:27:22 +0200
Subject: [Buildroot] Fwd: [RPi3] Trying to test WiFi On Raspberr Pi 3
In-Reply-To: <87h9epo1qp.fsf@dell.be.48ers.dk>
References: <CALtfCQYZXSFWSv8m5y+BkwKx-iOPrgYpZypvmtk_i2MLZebeiw@mail.gmail.com>
 <CALtfCQZ9GAfL3qYuJK97XAETVhE4PNnr+R6aL-2JBC6UrRTn1w@mail.gmail.com>
 <5719EB20.6090107@armadeus.com>
 <CALtfCQb5w8ygEpiqE=_RVOzF7FpC62uF=TK7Fau7+xZ3MZMo-g@mail.gmail.com>
 <CALtfCQaW+aMMoXsm=Fc9r9rPbzsEwYLRbk1DvjN5wVsfzTOMfA@mail.gmail.com>
 <87h9epo1qp.fsf@dell.be.48ers.dk>
Message-ID: <CALtfCQYp3SneJWWWt-7i=i=f=+JT_7ioN+uCwNz-GP7QoX_k-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

I've tried with both repositories, the RPi-Distro [
https://github.com/RPi-Distro/firmware-nonfree/tree/master/brcm80211/brcm]
and OpenELEC [ https://github.com/OpenELEC/wlan-firmware] both works fine.
It seems to be they are the same bin file (I made a kompare between them).

But the questions is, Could anyone add this files to the linux-firmware
package, or Could we create a new build package called
linux-firmware-nonfree with this files? I don't have any idea If we can get
this files from a legal point of view.

Best regards.

On 25 April 2016 at 22:46, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Oscar" == Oscar Gomez Fuente <oscargomezf@gmail.com> writes:
>
>  > Hi,
>  > I've just solved the problem. First of all, you have to download the
>  > firmware from this git repository:
> https://github.com/OpenELEC/wlan-firmware
>
>  > Then you have to select the following packages on buildroot:  crda,
>  > iw,  wireless-regdb and wpa_supplicant.
>
> Thanks.
>
>  > So It will be very useful to add the files brcmfmac43430-sdio.bin and
>  > brcmfmac43430-sdio.txt to the linux-firmware package.
>
> I don't think these are available in linux-firmware. It seems like we
> need to get them from rpi-firmware-nonfree:
>
> https://github.com/RPi-Distro/firmware-nonfree/tree/master/brcm80211/brcm
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160426/b39ba65d/attachment.html>
