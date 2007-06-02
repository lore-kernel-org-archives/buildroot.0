From: Rod Boyce <buildroot@teamboyce.co.uk>
Date: Sat, 02 Jun 2007 12:06:50 +0100
Subject: [Buildroot] ALSA tools for build-root
In-Reply-To: <20070602103246.GL12010@aon.at>
References: <46613FBE.7080709@teamboyce.co.uk> <20070602103246.GL12010@aon.at>
Message-ID: <46614F4A.8090703@teamboyce.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
>> +ALSA-TOOLS_DIR := $(BUILD_DIR)/$(patsubst %.tar.bz2,%,$(ALSA-TOOLS_SOURCE))
>>     
>
> Also, i'm curious where you picked up this notion of setting the
> FOO_DIR.
>
> The established way is a simple
> FOO_DIR:=$(BUILD_DIR)/foo-$(FOO_VERSION)
>   
This way means I only have to type the name and version once, I'm a 
great believer in if I can make something automatic then eliminate the 
chance the user (mostly me) can get it wrong the second time.  You 
rejected the $(shell basename .... ) approach which I agree with the 
rejection of using another shell to do something that make is quite 
capable of doing just makes sense.  I guess when I started looking at 
all this I used mpg123 version 16930 as my starting point.  I would 
prefer not to see this changed as long at the packaging convention is 
kept the same.  If the ALSA group ever change there packaging convention 
to not use name+version for the folder then I will change the *_DIR to 
suit.  But while it is the same and can be automatically extracted from 
the package filename I would prefer to use this automated approach.

Hope that makes sense, ultimately since I will not be personally 
committing this to SVN it is up to whoever commits this patch to SVN to 
decide.

Regards,
Rod Boyce
