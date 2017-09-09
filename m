From: Petr Kulhavy <brain@jikos.cz>
Date: Sat, 9 Sep 2017 22:53:06 +0200
Subject: [Buildroot] [PATCH 1/1] linuxptp: bump to the latest version
In-Reply-To: <20170909220851.56a41dc1@windsurf.lan>
References: <1504977449-30925-1-git-send-email-brain@jikos.cz>
 <20170909220851.56a41dc1@windsurf.lan>
Message-ID: <a9a2f132-bb2f-a79e-cd8e-4116ae096691@jikos.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 09/09/17 22:08, Thomas Petazzoni wrote:
> Hello,
>
> On Sat,  9 Sep 2017 19:17:29 +0200, Petr Kulhavy wrote:
>
>> diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
>> index ccda2d6..de28ee4 100644
>> --- a/package/linuxptp/linuxptp.hash
>> +++ b/package/linuxptp/linuxptp.hash
>> @@ -1,2 +1,2 @@
>> -# Locally computed:
>> -sha256	b8190ab71a99f1dc32847f33cb301d2464d3f9e5f4c51300d55589aff42e8b3f  linuxptp-97c351cafd7327fd28047580c9e2528a6f7e742b.tar.gz
>> +# No hash for linuxptp, cloned from a remote repo
>> +none	xxx								  linuxptp-17c9787b1d6891636b5be9e4e5a08278b44e9a7a.tar.gz
> Why are you removing the hash ?
Well, I was just following the BR manual :-) Where it says that "none" 
is used for cloned repositories.

> Buildroot's mechanism to clone from a Git repository and generate a
> tarball is reproducible, so we can use hashes and we do use them.
Is there a command to just clone and compress the repo via BR?
The <package>-extract make target fails if the hash doesn't exist and 
consequently deletes the temporary files.

Petr
