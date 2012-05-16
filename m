From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 16 May 2012 23:45:53 +0200
Subject: [Buildroot] [PATCH v2 03/11] manual: add prerequisite.txt
In-Reply-To: <CAAXf6LUdn0qTrz+hBp0RHSp8eRWkm=99MpexTANYO_DQ4SN9_A@mail.gmail.com>
References: <4FAEEFA8.2070005@mind.be>
 <1336905501-9757-1-git-send-email-s.martin49@gmail.com>
 <1336905501-9757-4-git-send-email-s.martin49@gmail.com>
 <CAAXf6LUdn0qTrz+hBp0RHSp8eRWkm=99MpexTANYO_DQ4SN9_A@mail.gmail.com>
Message-ID: <CAHXCMM+E282t46Ug8W1zAr-2QUgb95dy5M09qc4jDOrQO2mgMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thx for the review.

2012/5/16 Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>:
>> +
>> +[[requirement-optional]]
>> +
>> +Optional packages
>> +~~~~~~~~~~~~~~~~~
>> +
>> +* Build tools:
>> +** +gawk+
>> +
>> +* Source fetching tools:
>> +** +cvs+
>> +** +git+
>> +** +mercurial+
>> +** +subversion+
>
> What's the reasoning behind these 'optional requirements' ?
Actually, I followed the comments from Thomas P. on the first post, see:
http://lists.busybox.net/pipermail/buildroot/2012-March/051972.html

> People that are new to buildroot may simply install all 'requirements'
> and hence install tools like cvs or one of the other version control
> systems, while it won't actually be used, unless they select a package
> that downloads using that method.
> Moreover, some tools that could fit in this category are missing, like
> bazaar or scp.
You're right, I've omitted them and others...

>
>> +
>> +* Configuration interface dependencies (requires development libraries):
>> +** +qt4+ to use the 'xconfig' interface
>> +** +glib2+, +gtk2+ and +glade2+ to use the 'gconfig' interface
>> +
>> +* Development libraries:
>> +** +zlib1+
>> +** +netpbm10+ (for +fbtest+)
>> +** +python-xcbgen+ (for +Matchbox+ on Debian based system)
>> +// ** +jdk+ and and depending on the host system +gcj-compat+ for Java
>> +// development (for +java+, +jamvm+ and +gnu-classpath+)
>> +
>
> I would think that the intention of buildroot is that most
> non-standard dependencies are handled within buildroot.
So am I.

> One can safely expect make and gcc to be present, but is it currently
> so that such things like netpbm10 are needed? If so, shouldn't they be
> built as host-netpbm10 etc ?
Sure. A new item on the todo list ;-)

To write this page, I got inspired from:
http://www.armadeus.com/wiki/index.php?title=Ubuntu/Debian_installation_prerequisites
BR moves fast and the Armadeus Project is not based on the latest release, so...

> If we can do that, the above section can be removed.
I agree.

> Otherwise:
> s/and and/and/
>


Cheers,

Sam
