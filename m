From: Eugen.Hristev at microchip.com <Eugen.Hristev@microchip.com>
Date: Mon, 28 Jun 2021 09:11:12 +0000
Subject: [Buildroot] Question on users and ssh access
In-Reply-To: <37078d3b-031f-8643-e200-62300beb1ae4@inbox.ru>
References: <82f467ec-fbb3-9e87-be88-b5b51fc9b632@microchip.com>
 <37078d3b-031f-8643-e200-62300beb1ae4@inbox.ru>
Message-ID: <09afc5e8-3f75-8776-fee1-cf4c63cfb0ed@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 6/28/21 12:06 PM, Maxim Kochetkov via buildroot wrote:
> 28.06.2021 11:55, Eugen.Hristev--- via buildroot wrote:
>> Hello everyone,
>>
>> Maybe you can help me with a small matter related to user accounts in
>> Buildroot ?
>>
>> By default the /home directory does not exist, thus when using adduser
>> to create a user, the creation of /home/foo fails ... and this causes
>> login with ssh to the user impossible due to lack of home dir.
>>
>> Any recommendation on how to solve this ? It is preferred to set a
>> password for root for ssh access (as root has /root as home) ? or add a
>> post-script to create the /home in the rootfs ?
>>
>> Thanks !
>> Eugen
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
> 
> Try this:
> https://buildroot.org/downloads/manual/manual.html#customize-users

Thanks, but I do not wish to have new default users for the buildroot 
image (at compile time).

I wish the user who flashes the buildroot image can create new users on 
demand, without the problem that adduser fails in creating their home 
directory

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
