From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 28 Apr 2016 14:26:56 +0200
Subject: [Buildroot] [PATCH v3] domoticz: new package
In-Reply-To: <5721E517.1080804@free.fr>
References: <28446_1461740616_57206448_28446_378_1_b908e8f2-8c6a-4068-b4d9-be1630cc0fa5@OPEXCLILM6D.corporate.adroot.infra.ftgroup>
 <5721E517.1080804@free.fr>
Message-ID: <CAHXCMMJphUpUNKRkCs1rgj64MOy2cHUoNsf_ic0recC4vNu_Nw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Thu, Apr 28, 2016 at 12:25 PM, Julien Boibessot
<julien.boibessot@free.fr> wrote:
> Hello Fabrice,
>
> On 27/04/2016 09:03, fabrice.fontaine at orange.com wrote:
>> Domoticz is a Home Automation System that lets you monitor andi
>> configure various devices like: Lights, Switches, various
>> sensors/meters like Temperature, Rain, Wind, UV, Electra, Gas, Water
>> and much more. Notifications/Alerts can be sent to any mobile device.
>
> cool, one more domotic stuff in BR !
> any plan on Enocean ? :-)
>
> my comments below
>
[...]
>
> I have build tested and run tested your patch and noticed the following
> things:
> * why is domoticz binary installed in /usr and not /usr/bin ?
Looks like domoticz kinda screws the install rules [1] :-/
It could be fixed like [2], but some additional changes would
certainly be needed to adjust the search location for scripts, config,
etc.

> * updatedomo, License.txt and History.txt are installed in /usr, but
> IMHO not needed
> * why don't you add a config option that would install domoticz.sh in
> /etc/init.d to automatically start domoticz at startup ?
>
> Otherwise it runs fine with openzwave ;-)
>
> Best regards,
> Julien
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

[1] https://github.com/domoticz/domoticz/blob/master/CMakeLists.txt#L635
[2] http://code.bulix.org/pi7pxt-98018?raw

Regards,

-- 
Samuel
