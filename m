From: Floris Bos <bos@je-eigen-domein.nl>
Date: Mon, 08 Dec 2014 01:19:27 +0100
Subject: [Buildroot] [PATCH 1/1] lighttpd: install fastcgi config for php
In-Reply-To: <20141207235043.01177f0c@free-electrons.com>
References: <1417559724-25091-1-git-send-email-bluemrp9@gmail.com>
 <20141207235043.01177f0c@free-electrons.com>
Message-ID: <5484EE8F.7030501@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/07/2014 11:50 PM, Thomas Petazzoni wrote:
> Dear Ryan Coe,
>
> On Tue,  2 Dec 2014 14:35:24 -0800, Ryan Coe wrote:
>> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
>> ---
>>   package/lighttpd/fastcgi.conf |  7 +++++++
>>   package/lighttpd/lighttpd.mk  | 11 +++++++++++
>>   2 files changed, 18 insertions(+)
>>   create mode 100644 package/lighttpd/fastcgi.conf
> Seeing the feedback from Floris Bos on this patch, I marked your patch
> as 'Rejected' in our patch tracking system. Please work with Floris on
> a variant of your patch that takes into account also his use case
> (maybe by making the fastcgi installation optional?).

Yes, a config option under the lighttpd package to optionally install 
and configure PHP/FastCGI support might be nicer, instead of making the 
assumption based on the selection of the PHP CGI SAPI.


You might also want to consider using PHP-FPM
That does allow using FastCGI while spawning/killing PHP processes 
on-demand (instead of having a static number), so shouldn't suffer from 
the problems I mentioned earlier.
But haven't tested it myself.

Another point of attention is that lighttpd currently runs as root.
Might want to add a less privileged user to the system to run 
lighttpd/php under.


Yours sincerely,

Floris Bos
