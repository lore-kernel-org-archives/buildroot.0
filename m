From: Floris Bos <bos@je-eigen-domein.nl>
Date: Wed, 24 Aug 2016 23:45:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: switch from libmysqlclient
 to mysqlnd
In-Reply-To: <80e7a8d2-4b56-d9b1-62b6-de2d5d246efe@mind.be>
References: <1471971288-4564-1-git-send-email-bos@je-eigen-domein.nl>
 <65c74b5a-1a2a-f17f-5381-91b0cf7503c2@mind.be>
 <20160824190951.2d69b29f@free-electrons.com>
 <80e7a8d2-4b56-d9b1-62b6-de2d5d246efe@mind.be>
Message-ID: <28971986-1488-706d-5f68-c7b3c79eb801@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/24/2016 10:41 PM, Arnout Vandecappelle wrote:
>
> On 24-08-16 19:09, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Wed, 24 Aug 2016 02:26:51 +0200, Arnout Vandecappelle wrote:
>>> On 23-08-16 18:54, Floris Bos wrote:
>>>> The Mysql Native Driver has been the default mysql driver since
>>>> PHP 5.4, but buildroot was still using libmysqlclient.
>>>>
>>>> Mysqlnd has several advantages such as improved memory management
>>>> and the more favorable PHP licensing terms.
>>>> (can combine it with proprietary PHP extensions like Ioncube
>>>> loader, while libmysqlclient requires commercial licensing if you
>>>> link to it and do not fall under their GPL/FOSS license exception)
>>>   I may be too tired and could be missing something, but this commit message
>>> looks like it doesn't match the actual change...
>>>
>>>   I _guess_ that the php config script will use mysqlnd when the plain
>>> --with-mysqli option is passed, and will use libmysqlclient when --with-mysqli
>>> has a parameter. If this is the case, please specify it explicitly in the commit
>>> message. If this is not the case, it should _definitely_ be explained in the
>>> commit message :-)
>> Where do you see anything in the commit message that contradicts this?
>   Not exactly contradicts. I read the commit message and expected a change like
> changing --with-mysqli into --with-mysqlnd. But instead it just removed all the
> dependencies on mysql, which looked weird.

Well, could have also changed it to --with-mysqli=mysqlnd 
--with-pdo-mysql=mysqlnd
That's another way to say that you want the mysqli and pdo_mysql PHP 
extensions build, and that those in turn should use the mysqlnd driver 
to talk to a Mysql server.

Maybe that would have made the change better to understand.
However then it would like we are deviating from the PHP default by 
explicity setting a parameter.
Since mysqlnd is the default nowadays --with-mysqli --with-pdo-mysql is 
sufficient.


Should the meaning of individual configure options really be spelled out 
in commit messages?
What the change achieves is already in the first line "switch from 
libmysqlclient to mysqlnd"
And if anyone wants to know the finer details, he could look it up in 
the upstream docs: http://php.net/manual/en/mysqlinfo.library.choosing.php


Yours sincerely,

Floris Bos
