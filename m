From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 12 Mar 2015 14:53:28 +0100
Subject: [Buildroot] Changing permission recursively
In-Reply-To: <CANQCQpb=uFNRcp9k5pnH5DU5rsC8R6MrTY3tV9jhwpGnfsVXwA@mail.gmail.com>
References: <CA+TH9VmbEdw=Zx3C1_fHcnK=FDum+6C6UbsVVad12yR3gmK7AA@mail.gmail.com>
 <CANQCQpb=uFNRcp9k5pnH5DU5rsC8R6MrTY3tV9jhwpGnfsVXwA@mail.gmail.com>
Message-ID: <CA+TH9Vn6MJqXME9CkjtojSETPEf7wzBikBh5wTpzPqiPfvRn=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew Weber,

2015-03-12 13:41 GMT+01:00 Matthew Weber <matthew.weber@rockwellcollins.com>:
> Angelo,
>
> On Thu, Mar 12, 2015 at 4:08 AM, Angelo Compagnucci
> <angelo.compagnucci@gmail.com> wrote:
>>
>> Deal All,
>>
>> I'm in the process of building a rootfs for a custom application and
>> wondering the best way to change permissions recursively for a
>> directory.
>>
>> What I'm trying to achieve is to add some files via an overlay, but
>> files should have a specific owner/permission which should be read
>> from the buildroot's users table.
>>
>> I cannot find something like that in the documentation. Instead, the
>> documentation specifies how to add single files and change
>> owner/permission accordingly.
>
>
> I assume you've looked at building the a permissions table file which you
> would add to your "System configuration -> Path to the permission tables"
> config option (which uses makedev to apply the correc uid/gid and
> permissions to files/folders).  However I do believe it requires you to
> itemize out all items like you've mentioned.
> (http://buildroot.uclibc.org/downloads/manual/manual.html#makedev-syntax)
>
> Matt
>
>>
>> If I understand correctly, I should create a new user (if necessary)
>> with a specific UDI/GID and than use a POST_INSTALL_TARGET to change
>> permission using that UID/GID.
>> Alternatively, I can use FOO_PERMISSIONS with a per file granularity.
>>
>> Is this correct?

As I stated previously, I looked into FOO_PERMISSIONS that shares the
very same makedev syntax, and from my understanding, you should handle
files one by one.

I'm looking for changing permission recursively, without the effort to
itemize each file.

>>
>> Thanks!
>>
>> Sincerely, Angelo
>>
>> --
>> Profile: http://it.linkedin.com/in/compagnucciangelo
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
