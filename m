From: Johan Sagaert <sagaert.johan@proximus.be>
Date: Fri, 12 Feb 2016 10:38:59 +0100
Subject: [Buildroot] [PATCH] Don't install in mysql directory
In-Reply-To: <20151229212831.07ec737f@free-electrons.com>
References: <1450051027-23633-1-git-send-email-arnout@mind.be>
 <20151229212831.07ec737f@free-electrons.com>
Message-ID: <56BDA833.4080506@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Op 29/12/2015 om 21:28 schreef Thomas Petazzoni:
> Arnout,
>
> On Mon, 14 Dec 2015 00:57:07 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> Installing libraries in a subdirectory of /usr/lib leads to no end of
>> trouble. It requires either setting a RUN_PATH in the ELF files linked
>> with it or adding the path to ld.so.conf and calling ldconfig on the
>> target.
>>
>> So to simplify things, put everything in /usr/lib instead of
>> /usr/lib/mysql
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>>   .../0007-dont-install-in-mysql-directory.patch     | 182 +++++++++++++++++++++
>>   1 file changed, 182 insertions(+)
>>   create mode 100644 package/mysql/0007-dont-install-in-mysql-directory.patch
> I've applied the patch after doing the following tweaks:
>
>      [Thomas:
>       - tweak commit title.
>       - also remove ld.so.conf handling in mysql.mk, since it is no
>      longer necessary.]
>
> Thanks!
>
> Thomas
I noticed that the ld.so.conf is not working so i just created a 
symbolic link in /usr/lib pointing to libmysqlclient.so.16

Best Regards , Johan
