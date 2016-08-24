From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Aug 2016 19:09:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: switch from libmysqlclient
 to mysqlnd
In-Reply-To: <65c74b5a-1a2a-f17f-5381-91b0cf7503c2@mind.be>
References: <1471971288-4564-1-git-send-email-bos@je-eigen-domein.nl>
 <65c74b5a-1a2a-f17f-5381-91b0cf7503c2@mind.be>
Message-ID: <20160824190951.2d69b29f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 Aug 2016 02:26:51 +0200, Arnout Vandecappelle wrote:
> On 23-08-16 18:54, Floris Bos wrote:
> > The Mysql Native Driver has been the default mysql driver since
> > PHP 5.4, but buildroot was still using libmysqlclient.
> > 
> > Mysqlnd has several advantages such as improved memory management
> > and the more favorable PHP licensing terms.
> > (can combine it with proprietary PHP extensions like Ioncube
> > loader, while libmysqlclient requires commercial licensing if you
> > link to it and do not fall under their GPL/FOSS license exception)  
> 
>  I may be too tired and could be missing something, but this commit message
> looks like it doesn't match the actual change...
> 
>  I _guess_ that the php config script will use mysqlnd when the plain
> --with-mysqli option is passed, and will use libmysqlclient when --with-mysqli
> has a parameter. If this is the case, please specify it explicitly in the commit
> message. If this is not the case, it should _definitely_ be explained in the
> commit message :-)

Where do you see anything in the commit message that contradicts this?

Yes, the commit message doesn't explain at all that passing
--with-mysqli/--with-pdo-mysql with no arguments tell PHP to use its
native MySQL driver. But it also doesn't state the opposite.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
