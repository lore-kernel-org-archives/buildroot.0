From: Floris Bos <bos@je-eigen-domein.nl>
Date: Fri, 9 Sep 2016 13:29:05 +0200
Subject: [Buildroot] [PATCH 1/2] package/mysql: add MYSQL_SOCKET variable
In-Reply-To: <20160908222124.086a8b68@free-electrons.com>
References: <1473345222-10563-1-git-send-email-bos@je-eigen-domein.nl>
 <20160908144421.GA5740@free.fr>
 <1ac57a8d-e8b7-4a0a-8b6c-3951e584b54a@je-eigen-domein.nl>
 <20160908222124.086a8b68@free-electrons.com>
Message-ID: <0cd0c895-b2f4-3526-7b80-c53b217beef4@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/08/2016 10:21 PM, Thomas Petazzoni wrote:
> On Thu, 8 Sep 2016 17:27:24 +0200, Floris Bos wrote:
>
>>> If that is the default of mysql, is there a way to force it during
>>> configure? I'm a bit uneasy to rely on magic values, in case a future
>>> version changes this default location...
>> Yes, could force it to use that value with a --with-unix-socket-path=
>> configure option or in the server configuration file.
> That would be a good idea.
>
>>
>> Do note that while /tmp is the upstream default for all MySQL versions,
>> it is naturally not the safest location for multi-user systems.
>> If an unprivileged user gains access to the system sooner than MySQL is
>> up & running, he could create his own /tmp/mysql.sock and intercept
>> authentication details and queries of clients connecting.
>> So normal Linux distributions would override the default to a different
>> location, e.g. under /var/run
> So why not use --with-unix-socket-path=/var/run/mysql.sock ?

Ok, submitted a v2.
Still needs the second PHP part as well.


However someone else would need to check and test the systemd change, as 
I am never having much luck getting systemd to just work with buildroot.
"Timed out waiting for device dev-console.device" this time and no login 
prompt.
"Dependency failed for Serial Getty on console"
And no easy way to login by SSH either, given "*** automatic network 
configuration via DHCP is not compatible with networkd ***"


Yours sincerely,

Floris Bos
