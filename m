From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Date: Mon, 13 Feb 2017 16:08:55 +0100
Subject: [Buildroot] [PATCH v3] classpath: bump to version 0.99
In-Reply-To: <20170213142952.302e6ee4@free-electrons.com>
References: <20170212015451.16715-1-m.hoffmann@cartelsol.com>
 <20170212020444.32045-1-m.hoffmann@cartelsol.com>
 <20170212151431.1fe6cce3@free-electrons.com>
 <5160b52a-c48a-4b52-3d0e-9d73a6fb5c37@cartelsol.com>
 <20170213142952.302e6ee4@free-electrons.com>
Message-ID: <9a0676b3-6d9c-9f7c-ecf5-9e67a98c59c2@cartelsol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 13.02.2017 14:29, Thomas Petazzoni wrote:
> Hello,
> 
>>>  2. classpath has a "depends on BR2_PACKAGE_JAMVM" and jamvm has a
>>>     "select BR2_PACKAGE_CLASSPATH" which feels a bit like a circular
>>>     dependency. It would be nice to fix that up as well.  
>>
>> What would be the preferred solution here? JamVM selecting classpath
>> seems fine, as long as there is no alternative class library in
>> buildroot. So we allow selecting classpath but not JamVM? Here is a list
>> of projects using gnu classpath:
>> https://www.gnu.org/software/classpath/stories.html#jvm
> 
> My understanding is that the build dependency is:
> 
> 	jamvm -> classpath
> 
> i.e the classpath package needs to be built/installed before we build
> the jamvm package. If that's the case, then I would keep the "select
> BR2_PACKAGE_CLASSPATH" in jamvm/Config.in, but get rid of the "depends
> on BR2_PACKAGE_JAMVM" in classpath/Config.in.

That's my understanding as well.
I'll prepare a patch.

> 
> Peter, you're the one who added classpath originally (commit
> 5062f530081913bd0487f0f879be180f30836ab8) including this "depends on
> BR2_PACKAGE_JAMVM" dependency. What do you think ?
> 
> Thomas
> 

Marcus
