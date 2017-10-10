From: Marc Murphy <marcmltd@marcm.co.uk>
Date: Tue, 10 Oct 2017 21:25:35 +0000
Subject: [Buildroot] Successfully creating a new user
In-Reply-To: <44585641-6176-e9e2-5199-12361e75bda5@gmx.de>
References: <8AE4BE7D9622DF41B76E1AD887AA1A477BB1C23D@MARCM-SBS2011.marcmltd.local>
 <44585641-6176-e9e2-5199-12361e75bda5@gmx.de>
Message-ID: <8AE4BE7D9622DF41B76E1AD887AA1A477BB20F2A@MARCM-SBS2011.marcmltd.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>-----Original Message-----
>From: buildroot [mailto:buildroot-bounces at busybox.net] On Behalf Of Jan
>Schmidt
>Sent: 09 October 2017 22:29
>To: buildroot at busybox.net
>Subject: Re: [Buildroot] Successfully creating a new user
>
>On 09.10.2017 23:01, Marc Murphy wrote:
>> Hello,
>> Currently using buildroot-2017.02 and trying to add a user.
>>
>> I have been reading through the documentation about adding new users to
>my image and declared the path to the users file using
>BR2_ROOTFS_USERS_TABLES, this points to a file new_users in my
>board/boardname folder.
>>
>> To test I used the defined example user:
>> test 8000 wheel -1 = - /bin/sh - Test user
>
>> test:x:8000:10:Test user^M:/:/bin/sh
>>
>> What is generating the ^M ??
>> Even if I edit passwd and remove the ^M I can't log in.
>
>
>Hi Marc,
>
>"Test user" is the last column at your file. Could it be, that you saved it DOS
>formatted with CRLF line ending?
>
>jan
>
Hi Jan
I have had another go and recreated everything, this time it worked :)

As you say it could be a windows/linux battle for line ending.....
Previously I used Visual Studio to edit the file I created with touch and vi.
This time I just used vi.

Onto folder permissions now.

Thanks again
Marc
>_______________________________________________
>buildroot mailing list
>buildroot at busybox.net
>http://lists.busybox.net/mailman/listinfo/buildroot
