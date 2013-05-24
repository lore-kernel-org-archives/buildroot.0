From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 24 May 2013 18:51:47 +0200
Subject: [Buildroot] Environment Variables and CMAKE
In-Reply-To: <1369239715.2814.31.camel@john-ubu>
References: <1369239715.2814.31.camel@john-ubu>
Message-ID: <519F9AA3.8060600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/05/13 18:21, john wrote:
> Hi,
>
> I have a cmake based project which I am trying to incorporate into
> buildroot-2012.05
>
> As part of the configuration of the code I need to pass it an
> environment variable $(CLIENT_VER) which I generate at the time of
> building in the source directory (which I check out of SVN).
> I have tried various approaches without success.
[snip]
> My basic question is this:
> Is there someway to pickup an environment variable in the process that
> processes the .mk file?


  Isn't this what you're looking for?

CLIENT_BARROW_CONF_ENV = `$(CLIENT_BARROW_SRCDIR)set_environment.sh`

(and modify the script to echo the assignments rather than setting them).

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
