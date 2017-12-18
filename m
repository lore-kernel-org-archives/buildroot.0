From: Mario Lang <mlang@blind.guru>
Date: Mon, 18 Dec 2017 12:31:43 +0100
Subject: [Buildroot] [PATCH] package/brltty: disable features and add
 optional dependencies
In-Reply-To: <20171218110127.6df4ba7e@windsurf> (Thomas Petazzoni's message of
 "Mon, 18 Dec 2017 11:01:27 +0100")
References: <20171218095143.15343-1-mlang@blind.guru>
 <20171218110127.6df4ba7e@windsurf>
Message-ID: <871sjsclwg.fsf@home.blind.guru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

> On Mon, 18 Dec 2017 10:51:43 +0100, Mario Lang wrote:
>> * --without-midi-package should fix a number of autobuild failures.
>
> Which ones? We like to have references to autobuilder failures.

At least these two:
http://autobuild.buildroot.net/results/0c4f557c2ad276b1ed065119532af37c0af5f014
http://autobuild.buildroot.net/results/ea82b7c7732821368746ddddb5d529e97c9b6c16

>> * Disable a number of speech drivers to avoid build failures
>>   if they are installed on the host.
>> * Optional dependency on espeak and flite fixes builds where
>>   espeak or flite are installed on the host.
>
> Autobuilder failure references ?

These failures didn't show up on any autobuilder, as autobuilders
typically don't have commercial speech synthesizers or espeak/flite
installed on the host.  But these build failures showed up during builds
of BRLTTY users.  In particular, espeak, flite and speechd were
accidentally picked up from the host during configure.

-- 
CYa,
  ????? | Blog: <https://blind.guru/>  GitHub: <https://github.com/mlang/>
  .''`. | Twitter: @blindbird23        FaceBook: disyled
 : :' : | SoundCloud: <soundcloud.com/mario-lang>
 `. `'  | YouTube: <youtube.com/user/mlang23>
   `-
