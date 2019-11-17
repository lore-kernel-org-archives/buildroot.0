From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Nov 2019 16:40:11 +0100
Subject: [Buildroot] [PATCH 1/5] package/spice: add optional gdk-pixbuf
 dependency
In-Reply-To: <CAPi7W82gKs0tkx+QvxSHB36W56KpgbHxc38VbS+eV4MuejZ4sA@mail.gmail.com>
References: <20191114191321.11789-1-fontaine.fabrice@gmail.com>
 <20191115202029.GH26360@scaer>
 <CAPi7W82gKs0tkx+QvxSHB36W56KpgbHxc38VbS+eV4MuejZ4sA@mail.gmail.com>
Message-ID: <0890455a-b08d-a7e8-6ab8-c10103dca713@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/11/2019 21:27, Fabrice Fontaine wrote:
> Hi Yann,
> 
> Le ven. 15 nov. 2019 ? 21:20, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>>
>> Fabrice, All,
>>
>> On 2019-11-14 20:13 +0100, Fabrice Fontaine spake thusly:
>>> This dependency has been added in version 0.14.1 with
>>> https://gitlab.freedesktop.org/spice/spice-common/commit/d58a5b6a5a25134396661e1d805dfc567181e3af
>>>
>>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>> ---
>>>  package/spice/spice.mk | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/package/spice/spice.mk b/package/spice/spice.mk
>>> index 16e57441a8..f5801ce0ff 100644
>>> --- a/package/spice/spice.mk
>>> +++ b/package/spice/spice.mk
>>> @@ -13,6 +13,7 @@ SPICE_INSTALL_STAGING = YES
>>>  SPICE_DEPENDENCIES = \
>>>       host-pkgconf \
>>>       jpeg \
>>> +     $(if $(BR2_PACKAGE_GDK_PIXBUF),gdk-pixbuf) \
>>
>> I see you've gine for conciseness here. However, I think we want to
>> handle this optional dependency like we handle the optional dependency
>> on opus, lines 53..56.
> OK, I can send a v2 with this change however I've also think about it
> and I can also send a v2 that disable tests in spice-common.

 Disabling tests is clearly better, even without the considerations below.

> This will
> avoid this gdk-pixbuf dependency as well as the dynamic library
> dependency (I'll move it to celt051). The only drawback is that I'll
> have to add a hook to call autoreconf in subprojects/spice-common.

 Why? A toplevel AUTORECONF=YES seems to work fine.

 Regards,
 Arnout

> What do you think about this proposal?
>>
>> Regards,
>> Yann E. MORIN.
>>
>>>       libglib2 \
>>>       openssl \
>>>       pixman \
>>> --
>>> 2.23.0
>>>
>>
>> --
>> .-----------------.--------------------.------------------.--------------------.
>> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
>> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
>> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
>> '------------------------------^-------^------------------^--------------------'
> Best Regards,
> 
> Fabrice
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
