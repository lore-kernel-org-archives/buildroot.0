From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Sep 2019 09:17:45 +0200
Subject: [Buildroot] [All Systems Go!] Buildroot : Using embedded tools
 to build container images
In-Reply-To: <CAB0FRsuUa9dsAy9_qc9JEO2802Q2mZ=v-qLoLTHBo+f6mEnQBQ@mail.gmail.com>
References: <8c2d3dbb-8f85-7f1d-c82b-65f0573a7c76@smile.fr>
 <CAB0FRstSC9J9t90KH=NUA54Z9Ob=HysDUjNpvaE_-KSEmQtCYw@mail.gmail.com>
 <f8bc8621-31de-e542-657e-575fbaa2d48c@mind.be>
 <CAB0FRsuUa9dsAy9_qc9JEO2802Q2mZ=v-qLoLTHBo+f6mEnQBQ@mail.gmail.com>
Message-ID: <825d996b-705a-104d-aacf-ce90dfb01704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22/09/2019 20:07, Fran?ois Perrad wrote:
[snip]
>>  Yeah, except unfortunately docker security sucks, so on most distros you
>> need
>> sudo to run any docker command, even 'docker build'.
>>
>>
> see section "Manage Docker as a non-root user" in
> https://docs.docker.com/install/linux/linux-postinstall/
> on Ubuntu, I just run:
>     $ sudo usermod -aG docker $USER

 Yes, but the thing is, putting a user in the docker group is more or less the
same as giving them root access. So putting NOPASSWD in sudoers is basically
doing the same thing.

 For people who can use sudo, fine, but they can just as well do sudo.

 For people who can't use sudo (e.g. because the (build) machine is centrally
managed and users are not trusted), any competent sysadmin will also not allow
them to use docker.

 Regards,
 Arnout
