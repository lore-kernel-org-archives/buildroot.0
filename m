From: Andreas Naumann <dev@andin.de>
Date: Mon, 16 Mar 2020 22:15:23 +0100
Subject: [Buildroot] [PATCH v6 14/28] package/qt5webengine: Convert to
 qmake infra
In-Reply-To: <20200311230137.3c7f06ab@windsurf>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-15-anaumann@ultratronik.de>
 <20200311230137.3c7f06ab@windsurf>
Message-ID: <d0c6201f-ebee-288e-6a3a-dac18829cca1@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 11.03.20 23:01, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 17 Feb 2020 22:23:36 +0100
> Andreas Naumann <anaumann@ultratronik.de> wrote:
> 
>> Mostly straightforward conversion but keeping custom config/build env
>> to apply the python2 workaround.
>>
>> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> 
> I've applied, but I have a comment, see below.
> 
>> +QT5WEBENGINE_CONF_ENV = $(QT5WEBENGINE_ENV)
>> +QT5WEBENGINE_MAKE_ENV = $(QT5WEBENGINE_ENV)
> 
> I'm not really thrilled by this, and we had to do the same in
> qt5webkit. This is modeled after the autotools-package infrastructure,
> where normally environment variables passed to the ./configure script
> don't need to be passed again at build time.
> 
> But if with qmake they are needed at both configure time and build
> time, then perhaps we should change to have a single <pkg>_ENV
> variable, passed at both configure and build time.

Actually I dont know which of the env settings are needed at configure 
time and which at build time or both. I've just kept the logic as it was.

regards,
Andreas

> 
> Let's see how many packages need this, and we'll adjust later if needed.
> 
> Best regards,
> 
> Thomas
> 
