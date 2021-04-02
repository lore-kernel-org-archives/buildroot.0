From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Fri, 2 Apr 2021 11:08:03 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/wpa_supplicant: fix wrong
 config
In-Reply-To: <fbef5119-fcd2-c9c8-f4c0-165aee254d41@aliyun.com>
References: <20210316021804.3790808-1-tianyuanhao@aliyun.com>
 <20210317033739.71436-1-tianyuanhao@aliyun.com>
 <fbef5119-fcd2-c9c8-f4c0-165aee254d41@aliyun.com>
Message-ID: <f057be02-9655-a7b6-9417-2b97aa28640b@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/04/2021 03:43, Tian Yuanhao wrote:
> Hi Nicolas,
> 
> In my opinion, the two options CONFIG_CTRL_IFACE and 
> CONFIG_CTRL_IFACE_DBUS_NEW are not directly related except for their 
> similar names. It should be correct now. Could you please test it?

It works, you can add my Tested-By.

However, the maintainers will probably ask you to :
- Put the changelog below the "---" line, so that it does not appear in 
the commit message
- Maybe do one change at a time. The fix to disable CTRL_IFACE and the 
fix to disable CTRL_IFACE_DBUS_INTRO are two separate things that maybe 
should be in two patches.

> On 2021/3/17 ??11:37, Tian Yuanhao wrote:
>> When BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE is not set and
>> BR2_PACKAGE_WPA_SUPPLICANT_DBUS=y, CONFIG_CTRL_IFACE_DBUS_NEW will be
>> enabled by 's/^#\(CONFIG_CTRL_IFACE_DBUS_NEW\)/\1/' first, and then
>> disabled by 's/^\(CONFIG_CTRL_IFACE\)/#\1/'.
>>
>> v2:
>> ?? - fix it by adding '\>' after CONFIG_CTRL_IFACE
>> ?? - disable CONFIG_CTRL_IFACE_DBUS_INTRO when not enabled
>>
>> Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
>> ---
>> ? package/wpa_supplicant/wpa_supplicant.mk | 4 +++-
>> ? 1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/wpa_supplicant/wpa_supplicant.mk 
