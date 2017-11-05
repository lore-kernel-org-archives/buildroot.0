From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Nov 2017 09:16:04 +0100
Subject: [Buildroot] [PATCH 1/2] dhcpcd: add SysV start-up script
In-Reply-To: <20171104232246.444c7ca3@windsurf>
References: <20171031223659.6831-1-code@mmayer.net>
 <20171031223659.6831-2-code@mmayer.net>
 <20171102230602.3c61e8d2@windsurf> <20171102221847.GA23314@scaer>
 <20171102232345.5a434af8@windsurf>
 <3f7fff7b-be5a-42ff-985f-0e860c98acb3@mind.be>
 <20171104230331.7ee309cb@windsurf>
 <7c1fde5e-099e-7a22-4b13-4ac9e81f3d87@mind.be>
 <20171104232246.444c7ca3@windsurf>
Message-ID: <20171105081604.GB2996@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout,  All,

On 2017-11-04 23:22 +0100, Thomas Petazzoni spake thusly:
> On Sat, 4 Nov 2017 23:07:01 +0100, Arnout Vandecappelle wrote:
> >  Exactly. "Failure" anyway just means an error message on the console, not that
> > the system fails to boot.
> 
> Sure, but some scripts currently just "exit 0" with no error message
> whatsoever when the configuration file is missing.
> 
> So, let's summarize our policy:
> 
>  * Never check if the daemon executable is present, because that's
>    silly, Buildroot guarantees it's there.
> 
>  * If the daemon needs a configuration file, always check if it exists,
>    and if not, bail out with an error message.
> 
> But... wait, if Buildroot guarantees that it installs a configuration
> file for this daemon, having the init script check its presence is
> pretty much as silly as checking the presence of the daemon executable
> itself.
> 
> So?

  * Never check if the daemon executable is present, because that's
    silly: Buildroot guarantees it's there;

  * Never check for the daemon configuration file, because that's silly:
    Buildroot guarantees it's there;

  * Check if there is a startup-script override configuration file in
    /etc/default/<foo>, and source it if present.

The /etc/default/<foo> config file is here to override the options pased
to the daemoin, for example to add more options, or to entorely replace
them. Its format is daemon-dependent (we don't want to enforce one, at
least).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
