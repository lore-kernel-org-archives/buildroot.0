From: Bhattiprolu RaviKumar <ravikumar.bhattiprolu@gmail.com>
Date: Mon, 1 Feb 2021 16:00:41 +0530
Subject: [Buildroot] Question on udhcpc script
Message-ID: <CAL2JCb_UdG5-PpWbz3Yd84mSM47pGJHsjyUOn7Tzm6r_=Q4Dkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 All,
  We are using busybox to get DHCPv6  address. However, I am bit confused
on the part of the script /etc/udhcpc.d/50default:

wait_for_ipv6_default_route() {
*        printf "Waiting for IPv6 default route to appear"*
        while [ $IF_WAIT_DELAY -gt 0 ]; do
*                if [ -z "$(ip -6 route list | grep default)" ]; then*
                        printf "\n"
                        return
                fi
                sleep 1
                printf "."
                : $((IF_WAIT_DELAY -= 1))
        done
        printf " timeout!\n"
}

The print says "Waiting for IPv6 default route to appear". However the if
statement is checking for "$(ip -6 route list | grep default)"to be null
(-z check) which means default route is not present.

In our case, after DHCP, default route gets setup and "$(ip -6 route list |
grep default)"returns an entry starting with default and since check is -z,
it continues in the loop and finally prints "timeout".

I am confused here. Am I missing something here?
regards,
Ravi
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210201/a7aa2cbc/attachment-0001.html>
